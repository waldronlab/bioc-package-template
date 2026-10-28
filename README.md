# MyPackage

[![Bioconductor CI](https://github.com/waldronlab/MyPackage/actions/workflows/ci.yml/badge.svg)](https://github.com/waldronlab/MyPackage/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/waldronlab/MyPackage/graph/badge.svg)](https://codecov.io/gh/waldronlab/MyPackage)

One-paragraph description of the package.

## Installation

```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("waldronlab/MyPackage")
```

## Using this template

This repository is a template for new Waldron Lab R/Bioconductor packages. It passes `R CMD check` and `BiocCheck` as it stands, and includes two GitHub Actions workflows:

- `.github/workflows/ci.yml`: `R CMD check`, `BiocCheck` and test coverage (Codecov) in the Bioconductor container, from [Bioconductor/workflows](https://github.com/Bioconductor/workflows). The Bioconductor version follows the branch name: `devel` checks against Bioc-devel, `RELEASE_X_Y` against that release.
- `.github/workflows/claude.yml`: Claude Code responds to `@claude` and reviews each new pull request once. See the [waldronlab/.github README](https://github.com/waldronlab/.github#claude-code-claudeyml-and-claude-reviewyml).

### Optional checks

`ci.yml` calls Bioconductor's reusable [`bioccheck.yml`](https://github.com/Bioconductor/workflows/blob/main/.github/workflows/bioccheck.yml). To change what it does, edit the `with:` block in `ci.yml`, or generate a new `ci.yml` with the [workflow generator](https://bioconductor.github.io/workflows/).

| Input | Default | What it does |
|---|---|---|
| `error_on` | `warning` | Fail the check on `never`, `note`, `warning` or `error` |
| `enable_pkgdown` | `false` | Build and deploy a pkgdown site to GitHub Pages (also uncomment the `permissions:` block) |
| `enable_cyclocomp` | `false` | Report each function's cyclomatic complexity as a downloadable artifact |
| `bioc_version` | from branch | Override the Bioconductor container, e.g. `RELEASE_3_22` |

Test coverage is on by default: `ci.yml` passes the `waldronlab` organization secret `CODECOV_TOKEN`, and coverage is uploaded on pushes and pull requests to non-release branches. Delete the `secrets:` block to turn it off. Outside `waldronlab`, add a `CODECOV_TOKEN` repository secret instead.

pkgdown needs one-time repository settings (GitHub Pages set to deploy from Actions, and deployment allowed from `RELEASE_*` branches). See [BiocCheck usage](https://github.com/Bioconductor/workflows/blob/main/bioccheck_usage.md#repository-configuration-for-optional-features) for the steps and for more status badges.

`ci.yml` tests only on Linux, against one Bioconductor version. For macOS, Windows and WebAssembly, see [multi-platform testing](https://github.com/Bioconductor/workflows#multi-platform-testing-using-r-universe-orgworkflows) with r-universe.

### Setting up a new repository

After creating a repository from this template (**Use this template → Create a new repository**, owner `waldronlab`):

1. **Rename the package.** Replace `MyPackage` with the package name everywhere, and rename the two files that contain it:

   ```sh
   NEW=YourPackage
   grep -rl MyPackage . --exclude-dir=.git | xargs sed -i '' "s/MyPackage/$NEW/g"   # on Linux: sed -i
   git mv R/MyPackage-package.R R/$NEW-package.R
   git mv vignettes/MyPackage.Rmd vignettes/$NEW.Rmd
   ```

2. **Edit `DESCRIPTION`**: Title, Description, authors, `biocViews` and dependencies.
3. **Replace the placeholder code**: `R/hello.R`, `tests/testthat/test-hello.R` and `man/hello.Rd`. Run `devtools::document()` after adding roxygen comments to regenerate `man/` and `NAMESPACE`.
4. **Rewrite this README** for the package, keeping the badge and the installation section.
5. **Keep `devel` as the default branch**, as Bioconductor does.

Claude needs no setup in `waldronlab`: the Claude GitHub App is installed on all repositories, and the `CLAUDE_CODE_OAUTH_TOKEN` organization secret is passed by `secrets: inherit`. Remove the `review` job from `claude.yml` to turn off automatic reviews.
