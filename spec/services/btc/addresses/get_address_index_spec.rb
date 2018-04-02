require 'rails_helper'

module Btc
  module Addresses
    module Creation
      module Btcruby
        RSpec.describe GetAddressIndex do

          # This should work even if the user switches from Electrum to Btcruby
          # and back -- there might be some addresses that will be wasted,
          # though.
          before do
            create(:address, coin: "btc")
            create(:address, coin: "ltc")
            create(:address, coin: "btc")
          end
          it "sets the address_index to the index in the Keychain to use" do
            resulting_ctx = described_class.execute
            expect(resulting_ctx.address_index).to eq 2
          end

        end
      end
    end
  end
end