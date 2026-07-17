# typed: true
# frozen_string_literal: true

# Homebrew formula for Fringe Retro Kit.
#
# This is the canonical copy, versioned alongside the code. It is mirrored to the Homebrew
# tap repository (FourFringe/homebrew-tap) as `Formula/fringe-retro.rb`, from where users
# install it:
#
#   brew install FourFringe/tap/fringe-retro
#
# It installs the pre-built macOS binary from the matching GitHub release (no compilation).
class FringeRetro < Formula
  desc "Inspect, edit, back up, and browse world maps from classic game saves"
  homepage "https://github.com/FourFringe/fringe-retro-kit"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FourFringe/fringe-retro-kit/releases/download/v#{version}/fringe-retro-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "db2a2e4f88354b5510708162143d1a403baea922d9ad4d00e3fb83cfe13b2587"
    end
    on_intel do
      url "https://github.com/FourFringe/fringe-retro-kit/releases/download/v#{version}/fringe-retro-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "660b90ae46c9db1458b6b5ca7ba777b28a978c1ede4510798905587c1b008002"
    end
  end

  def install
    bin.install "fringe-retro", "fringe-retro-map"
    # The release tarball also bundles the docs.
    doc.install "README.md", "COMMANDS.md" if File.exist?("README.md")
  end

  test do
    assert_match "fringe-retro #{version}", shell_output("#{bin}/fringe-retro --version")
    assert_match "fringe-retro-map #{version}", shell_output("#{bin}/fringe-retro-map --version")
  end
end
