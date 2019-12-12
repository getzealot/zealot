# frozen_string_literal: true

require 'app-info'

class DebugFileTeardownJob < ApplicationJob
  queue_as :default

  def perform(debug_file)
    parser = AppInfo.parse debug_file.file.file.file

    case parser.file_type
    when AppInfo::Platform::DSYM
      update_debug_file_version(debug_file, parser)
      parse_dsym(debug_file, parser)
    when AppInfo::Platform::PROGUARD
      update_debug_file_version(debug_file, parser)
      parse_proguard(debug_file, parser)
    end
  rescue => e
    logger.error "Can not teardown debug file: #{e}"
    logger.error e.backtrace.join("\n")
  end

  private

  def parse_dsym(debug_file, parser)
    parser.machos.each do |macho|
      debug_file.metadata.find_or_create_by(uuid: macho.uuid) do |metadata|
        metadata.size = macho.size
        metadata.type = macho.cpu_name
        metadata.object = parser.object
      end
    end
  end

  def parse_proguard(debug_file, parser)
    debug_file.metadata.find_or_create_by(uuid: parser.uuid) do |metadata|
      metadata.type = 'proguard'
      metadata.data = { files: files(parser) }
    end
  end

  def update_debug_file_version(debug_file, parser)
    if (release_version = parser.release_version) &&
      (build_version = parser.build_version)
      debug_file.update!(
        release_version: release_version,
        build_version: build_version
      )
    end
  end

  def files(parser)
    data = []
    Dir.glob(File.join(parser.contents, '*')) do |path|
      data << file_stat(path)
    end

    data
  end

  def file_stat(path)
    {
      name: File.basename(path),
      size: File.size(path)
    }
  end
end
