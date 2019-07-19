# ![terraform](https://www.terraform.io/assets/images/mega-nav/logo-terraform-ff69eaae.svg) Terraforming GCP  ![gcp](https://avatars2.githubusercontent.com/u/2810941?s=85&v=4)

Automate project setup with gcp and github.
> tldr; just a set of scripts that use gcloud cli tools and github api to create projects on both platforms.
> There's no terraform support for automating the mirroring process. But, there's a github app which solves the problem.

## Requirements

- [Terraform](https://www.terraform.io/)
- [gcloud cli](https://cloud.google.com/sdk/gcloud/)
- config.json in the same folder as `create_repo.py`

structure for config.json

```js
{
    "github":{
        "user":"....",
        "token":"...."
    }
}
```

## Usage

```bash
chmod +x create.sh
chmod +x create_repo.py
./create.sh
```

### Shortcomings

- Still need to do the `terraform` steps manually for now.
