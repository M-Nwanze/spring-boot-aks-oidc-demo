# 🛡️ my-secure-aks-app

A secure, zero-secrets Spring Boot application deployed to **Azure Kubernetes Service (AKS)** using:

- ✅ **GitHub Actions CI/CD**
- ✅ **OIDC + Workload Identity** (no service principal secrets)
- ✅ **Terraform** (Infrastructure as Code)
- ✅ **Docker** (containerized, non-root)
- ✅ **ACR / GHCR** (container registry)

> 🔐 **No credentials in repo** — uses **Azure AD Workload Identity** for secure, ephemeral access

![Spring Boot](https://img.shields.io/badge/Spring_Boot-%236DB33F?logo=spring&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?logo=microsoftazure&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=github-actions&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-%235835CC?logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-%232496ED?logo=docker&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?logo=openjdk&logoColor=white)

---

## 🎯 Demo

- 🌐 **Live Endpoint**: `http://<AKS-LOADBALANCER-IP>/actuator/health` → `{"status":"UP"}`
- 🔄 **Auto-Deploy**: Triggered on `git push` to `main`
- 💥 **Zero Downtime Updates**: Enabled via Kubernetes rolling deployments

---

## 🏗️ Architecture

```mermaid
graph LR
    A[GitHub Repo] -->|Push to main| B(GitHub Actions)
    B -->|OIDC Token| C[Azure AD]
    C -->|AuthZ| D[Azure]
    D --> E[AKS Cluster]
    D --> F[ACR / GHCR]
    E --> G[Pod: spring-boot-demo] 
    ```



    ### 🔗 How It Works

1. Push to `main` triggers the CI/CD pipeline.
2. GitHub Actions uses **OIDC** to authenticate to **Azure AD**.
3. Azure grants temporary access to deploy resources.
4. Terraform provisions AKS and registry (ACR).
5. App is built, containerized, and pushed.
6. Kubernetes deploys the Pod via `kubectl apply`.

---

## 🔐 Security Highlights

- ✅ **No secrets in repo** — only OIDC federated identity
- ✅ **Minimal GitHub permissions**:

  ```yaml
  permissions:
    id-token: write
    contents: read   
  ```

- ✅ **Non-root container** — secure Docker practices
- ✅ **ACR & AKS isolated** in dedicated resource group
- ✅ **Terraform state managed locally** *(future: Azure Backend)*

---

## 📦 Technologies Used

| Category       | Tools |
|----------------|-------|
| Application    | Spring Boot, Java 17, Maven |
| Container      | Docker, non-root user |
| CI/CD          | GitHub Actions |
| Authentication | Azure AD Workload Identity (OIDC) |
| Kubernetes     | AKS, kubectl |
| Container Reg  | ACR (`acrspring2025`) or GHCR (planned) |
| IaC            | Terraform |
| Cloud          | Microsoft Azure |

---

## 🌟 Portfolio-Worthy Features

| Feature | Why It Matters |
|--------|----------------|
| ✅ **GitHub Actions** | Industry-standard CI/CD — expected in 2025+ roles |
| ✅ **OIDC / Workload Identity** | Eliminates hardcoded secrets — real Azure security best practice |
| ✅ **Terraform (IaC)** | Reproducible infrastructure, no manual clicks — enables DevOps at scale |
| ✅ **Docker + non-root** | Follows security best practices; reduces attack surface |
| ✅ `kubectl apply` with `--dry-run=client` | Enables safe, idempotent deployments |
| ✅ Clean Git history | Professional, readable, and maintainable — shows attention to detail |

---

## 📂 Project Structure

``` my-secure-aks-app/
├── src/                          # Spring Boot app
├── Dockerfile                    # Container image (non-root user)
├── pom.xml                       # Maven build config
├── .github/workflows/deploy-to-aks.yml  # CI/CD pipeline
├── main.tf                       # Terraform: AKS, ACR, networking
├── variables.tf                  # Input variables
├── outputs.tf                    # Output AKS info
├── README.md                     # This file
└── .gitignore                    # Exclude secrets, IDE files, build artifacts   
```

## 🧪 Validated & Working

- ✅ Local build and run: `./mvnw spring-boot:run`
- ✅ Docker image built: `docker build -t spring-boot-demo .`
- ✅ Image pushed to ACR
- ✅ AKS cluster created via Terraform
- ✅ CI/CD pipeline deploys on `git push`
- ✅ Service exposed via LoadBalancer
- ✅ `/actuator/health` returns `200 OK`

---

## 🚧 Roadmap

- [ ] Migrate from ACR to **GitHub Container Registry (GHCR)**
- [ ] Add **Terraform Cloud** or **Azure Backend** for remote state
- [ ] Enable **Argo CD** for GitOps
- [ ] Add **Application Insights** for monitoring
- [ ] Add GitHub Issue & PR templates

---

## 📬 Connect With Me

Open to opportunities and great conversations about cloud, DevOps, and secure CI/CD.  
Happy to connect and collaborate!

---

> ✅ **Final Commit Message:**  
> `git commit -m "docs: add project summary — secure CI/CD with OIDC, Terraform, and kubectl apply"`
>
