############################################################################################
# Copyright 2020 Palo Alto Networks.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
############################################################################################

output "eks_cluster_name" {
  value = aws_eks_cluster.ControlPlane.name
}

output "eks_cluster_endpoint" {
  value = split("//", aws_eks_cluster.ControlPlane.endpoint)[1]
}

output "kubectl_config_command" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.ControlPlane.name}"
}

output "kubectl_demo_application_deployment_command" {
  value = "kubectl apply -f ./sample-app/guestbook.yml"
}
