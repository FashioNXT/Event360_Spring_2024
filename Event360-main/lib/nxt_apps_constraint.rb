class NxtAppsConstraint
  def matches?(request)
    NxtApps.exists?(name: request.params[:app])
  end
end
