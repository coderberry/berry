class PwaController < ApplicationController
  skip_forgery_protection

  def service_worker
    respond_to do |format|
      format.js
    end
  end

  def manifest
    respond_to do |format|
      format.json
    end
  end

end
