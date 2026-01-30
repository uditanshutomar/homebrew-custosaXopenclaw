# custosaXopenclaw Homebrew Tap

Install:

  brew tap uditanshutomar/custosaXopenclaw
  brew install --cask --no-quarantine custosa
  open -a Custosa

Release flow:
- Upload `CustosaXopenclaw.zip` to GitHub Releases tag matching the cask version.
- Update `Casks/custosa.rb` version + sha256 for each release.
