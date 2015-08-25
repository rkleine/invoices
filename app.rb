require 'cuba'
require 'json'
require 'xeroizer'
require 'rack/cors'
require 'pry' if ENV['RACK_ENV'] != 'production'

def xero
  @xero ||= Xeroizer::PrivateApplication.new(
    ENV['XERO_CONSUMER_KEY'], ENV['XERO_CONSUMER_SECRET'], './certs/privatekey.pem'
  )
end

Cuba.use Rack::Static, urls: ['/app', '/favicon.ico'], root: 'public', index: 'index.html'

Cuba.define do
  res.headers['Content-Type'] = 'application/json'

  on 'api' do
    on ':id' do |id|
      invoices = xero.Invoice.all(:where => 'Contact.ContactID.ToString()=="'+id+'" && Type=="ACCREC" && Status<>"VOIDED"').tap { |i| i.map(&:line_items) }.flatten
      res.write invoices.to_json
    end

    on root do
      res.write xero.Contact.all(:where => { :is_customer => true, contact_status: 'ACTIVE' }).to_json
    end
  end
end
