# Boeschj Tap

This repository contains my Homebrew formulas for easy installation of my projects on macOS.

## How do I install these formulae?

`brew install boeschj/tap/<formula>`

Or `brew tap boeschj/tap` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "boeschj/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Available Formulas

### ShellGPT
An AI-powered command line assistant.
```bash
brew install boeschj/tap/shellgpt
```

## Updating Formulas for New Releases

When you release a new version of a project, follow these steps to update its formula:

1. Create and publish a new release on the project's repository
   ```bash
   # In the project repository:
   git tag v0.1.0  # Replace with new version
   git push origin v0.1.0
   ```

2. Get the SHA256 hash of the new macOS binary
   ```bash
   # Download the release
   curl -LO https://github.com/boeschj/shellgpt/releases/latest/download/shellgpt-mac-x86_64.tar.gz
   
   # Get SHA256 hash
   shasum -a 256 shellgpt-mac-x86_64.tar.gz
   ```

3. Update the formula file (e.g., `Formula/shellgpt.rb`)
   - Change the `VERSION = "x.x.x"` at the top of the file
   - Update the `sha256` value with the new hash

4. Commit and push the changes
   ```bash
   git add Formula/<formula name>.rb
   git commit -m "<applicable project>: update to version x.x.x"
   git push
   ```

5. Users can now update to the new version with:
   ```bash
   brew update
   brew upgrade <formula name>
   ```

## Adding New Formulas

1. Create a new Ruby file in the `Formula` directory (e.g., `Formula/myproject.rb`)
2. Use this template:
```ruby
class Myproject < Formula
  VERSION = "0.1.0".freeze
  
  desc "Your project description"
  homepage "https://github.com/boeschj/myproject"
  version VERSION

  on_macos do
    url "https://github.com/boeschj/myproject/releases/download/v#{VERSION}/myproject-mac-x86_64.tar.gz"
    sha256 "YOUR_MAC_BINARY_SHA256"
  end

  def install
    bin.install "myproject"
    # Add any additional files that need to be installed
  end

  test do
    assert_match "MyProject", shell_output("#{bin}/myproject --help")
  end
end
```

3. Update this README to add the new formula to the "Available Formulas" section

## Testing Formulas Locally

Before pushing changes, you can test the formula locally:
```bash
brew uninstall myproject

brew install --build-from-source Formula/myproject.rb
```
