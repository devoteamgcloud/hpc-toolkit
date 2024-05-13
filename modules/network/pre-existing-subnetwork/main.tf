/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/


data "google_compute_subnetwork" "primary_subnetwork" {
  name = try(var.subnetwork_name,null)
  region = try(var.region,null)
  project = try(var.host_project,null)
  self_link = try(var.subnetwork_self_link,null)

  lifecycle {
    postcondition {
      condition     = self.self_link != null
      error_message = "The subnetwork: ${var.subnetwork_self_link} could not be found."
    }
  }
}