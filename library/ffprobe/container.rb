# encoding: utf-8

module FFProbe
  # The +Container+ wraps the video and audio streams of a container file.
  class Container
    # The associated video streams.
    attr_accessor :video_streams

    # The associated audio streams.
    attr_accessor :audio_streams

    # The file path.
    attr_accessor :path

    def initialize path
      @path = path
    end

    def parse! json
      pp json
    end
  end
end
