# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.debug("stream_from product_channel")
    stream_from "product_channel"
    logger.debug("after stream_from product_channel")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
