<h1>Terraform Azure Infrastructure Deployment</h1>

<div class="section">
  <p>
    This repository contains Terraform scripts to deploy a <strong>secure and scalable Azure infrastructure</strong>. 
    The setup includes networking, compute, load balancing, and secure access, following best practices for cloud security and scalability.
  </p>
</div>

<div class="section">
  <h2>Infrastructure Components</h2>
  <h3>Virtual Network (VNet) and Subnets</h3>
  <ul>
    <li>Configured private subnets for secure VM deployment.</li>
    <li>Segregates resources for better security and network management.</li>
  </ul>
  <h3>Virtual Machine Scale Sets (VMSS)</h3>
  <ul>
    <li>Automatically deploys multiple VMs.</li>
    <li>Supports autoscaling to adjust VM capacity based on workload for optimized performance and cost.</li>
  </ul>
  <h3>Load Balancer</h3>
  <ul>
    <li>Public-facing load balancer to distribute traffic across VMSS instances.</li>
    <li>Integrated with a NAT Gateway for outbound internet connectivity from private subnets.</li>
  </ul>
  <h3>Secure Access</h3>
  <ul>
    <li>Azure Bastion for secure RDP/SSH access to VMs without exposing public IPs.</li>
    <li>Network Security Groups (NSGs) to control inbound and outbound traffic.</li>
  </ul>
  <h3>Terraform State Management</h3>
  <ul>
    <li>Uses remote backend (Azure Storage Account + Blob Container) for consistent and reliable state management.</li>
    <li>Supports collaboration across teams.</li>
  </ul>
</div>

<div class="section">
  <h2>Deployment Steps</h2>
  <ol>
    <li>Configure backend variables in <code>backend.tf</code>.</li>
    <li>Run <code>terraform init</code> to initialize the backend.</li>
    <li>Run <code>terraform plan</code> to review changes.</li>
    <li>Run <code>terraform apply</code> to deploy the infrastructure.</li>
  </ol>
</div>

<div class="section">
  <h2>Output</h2>
  <p>The final output is a Tetris game, which can be accessed in the browser.</p>
  <img src="https://github.com/user-attachments/assets/e45fe274-0586-4b13-94ea-6336de60168d" 
       alt="Tetris Game Screenshot" 
       width="600">
</div>
