# (C) Copyright 2016 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require_relative '../../api200/interconnect'

module OneviewSDK
  module API300
    module Synergy
      # Interconnect resource implementation for synergy on api300
      class Interconnect < OneviewSDK::API200::Interconnect
        LINK_TOPOLOGY_URI = '/rest/interconnect-link-topologies'.freeze


        # Retrieves the interconnect link topologies
        # @param [OneviewSDK::Client] client The client object for the OneView appliance
        # @return [Array] All the Interconnect Link Topologies
        def self.get_link_topologies(client)
          response = client.rest_get(LINK_TOPOLOGY_URI)
          response = client.response_handler(response)
          response['members']
        end

        # Retrieves the interconnect link topology with the name
        # @param [OneviewSDK::Client] client The client object for the OneView appliance
        # @param [String] name Switch type name
        # @return [Array] Switch type
        def self.get_link_topology(client, name)
          results = get_link_topologies(client)
          results.find { |interconnect_link_topology| interconnect_link_topology['name'] == name }
        end

      end
    end
  end
end