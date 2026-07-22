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
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/FourFringe/fringe-retro-kit/releases/download/v#{version}/fringe-retro-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3778f90aa751408bda570f2a1c962671502e44ab66f98d97dfaf8544c737239f"
    end
    on_intel do
      url "https://github.com/FourFringe/fringe-retro-kit/releases/download/v#{version}/fringe-retro-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ca479768a153287ac489a4bfdfe1e334c0fac9fcae0293a179baac3d3ad95709"
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
