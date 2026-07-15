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
  desc "Inspect, edit, and back up classic computer game save files"
  homepage "https://github.com/FourFringe/fringe-retro-kit"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FourFringe/fringe-retro-kit/releases/download/v#{version}/fringe-retro-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "29281bb5c848af5a13cfdc4588a2930fc0fd1117796005a38afb461f73030432"
    end
    on_intel do
      url "https://github.com/FourFringe/fringe-retro-kit/releases/download/v#{version}/fringe-retro-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5670c4d04d4db09baff27b86d270422b198b9c791bd8149c592507cc102faa4f"
    end
  end

  def install
    bin.install "fringe-retro"
    # The release tarball also bundles the docs.
    doc.install "README.md", "COMMANDS.md" if File.exist?("README.md")
  end

  test do
    assert_match "fringe-retro #{version}", shell_output("#{bin}/fringe-retro --version")
  end
end
