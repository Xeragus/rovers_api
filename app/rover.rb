# frozen_string_literal: true

class Rover
  attr_reader :name

  ROVERS = %w[curiosity opportunity spirit].freeze

  def initialize(name = 'curiosity')
    @name = name
  end

  def has_camera?(camera)
    cameras.include?(camera)
  end

  def exists?
    ROVERS.include?(@name)
  end

  private

  def cameras
    case @name
    when 'curiosity'
      %w[fhaz rhaz mast chemcam mahli mardi navcam]
    when 'opportunity', 'spirit'
      %w[fhaz rhaz navcam pancam minites]
    else
      []
    end
  end
end
