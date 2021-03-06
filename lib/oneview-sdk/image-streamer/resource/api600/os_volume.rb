# (C) Copyright 2018 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require_relative '../api500/os_volume'

module OneviewSDK
  module ImageStreamer
    module API600
      # OS Volume resource implementation for Image Streamer
      class OSVolume < OneviewSDK::ImageStreamer::API500::OSVolume
        # Get the details of the archived OS volume with the specified attribute.
        # @return [Hash] The details of the archived OS volume with the specified attribute
        def get_details_archive
          ensure_client && ensure_uri
          path = "#{BASE_URI}/archive/#{@data['uri'].split('/').last}"
          response = @client.rest_get(path)
          @client.response_handler(response)
        end

        # Retrieves the os volumes storage of the selected os volumes as per the selected attributes.
        # @return [Hash] The readonly artifacts of the selected OS Volumes.
        def get_os_volumes_storage
          ensure_client && ensure_uri
          path = "#{BASE_URI}/#{@data['uri'].split('/').last}/storage"
          response = @client.rest_get(path, { 'Content-Type' => 'none' }, @api_version)
          @client.response_handler(response)
        end
      end
    end
  end
end
