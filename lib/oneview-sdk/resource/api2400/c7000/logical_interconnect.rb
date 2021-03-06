# (C) Copyright 2021 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require_relative '../../api2200/c7000/logical_interconnect'

module OneviewSDK
  module API2400
    module C7000
      # Logical interconnect resource implementation for API2400 C7000
      class LogicalInterconnect < OneviewSDK::API2200::C7000::LogicalInterconnect
        # Updates the port flap interconnect settings for the logical interconnect
        def update_port_flap_settings
          raise IncompleteResource, 'Please retrieve the Logical Interconnect before trying to update' unless @data['portFlapProtection']
          update_options = {
            'If-Match' =>  @data['portFlapProtection'].delete('eTag'),
            'body' => @data['portFlapProtection']
          }
          response = @client.rest_put("#{@data['uri']}/portFlapSettings", update_options, @api_version)
          body = @client.response_handler(response)
          set_all(body)
        end
      end
    end
  end
end
