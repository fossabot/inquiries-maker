class InvoicesController < ApplicationController
  before_action :authenticate_user!
  include RescheduleInvoiceDelivery

  def index
    @inquiries = ReceivedInquiryResponse.order("id DESC")
  end
  def show
    @inquiries = ReceivedInquiryResponse.where('quarter = ?', params[:quarter])

    render pdf: file_name(@inquiries),
      template: "invoices/show.pdf",
      layout: "pdf.html.slim",
      page_size: 'A4',
      encoding: 'UTF-8',
      dpi: '300',
      # viewport_size: "1280x1024",
      page_height: "297mm",
      page_width: "210mm",
      handlers: [ :slim ],
      margin: { :left => "3mm",:right => "3mm", :top => "0mm", :bottom => "0mm" },
      print_media_type:               false,
      disable_smart_shrinking:        true,
      zoom: 1,
      show_as_html: params.key?('debug') # allow debugging based on url param
  end

  private
  def file_name(inquiries)
    helpers.detail('uos').gsub(' ','-') + '-Invoice-' + inquiries.first.quarter.gsub(' ', '-')
  end
end