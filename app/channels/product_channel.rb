# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "product_channel"
    logger.debug("ProductChannel method - subscribed")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen(data)
    logger.debug("ProductChannel method - listen")
    stop_all_streams
    stream_for data["product_id"]
  end
end
