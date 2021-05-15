class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user

    @subscription.save

    redirect_to community_path(@subscription.community_id)
  end

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end
end
