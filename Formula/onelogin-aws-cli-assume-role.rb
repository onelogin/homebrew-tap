class OneloginAwsCliAssumeRole < Formula
  desc "Get temporary AWS credentials by assuming an AWS role through OneLogin"
  homepage "https://github.com/onelogin/onelogin-aws-cli-assume-role"
  url "https://github.com/onelogin/onelogin-aws-cli-assume-role/archive/refs/tags/1.4.0.tar.gz"
  sha256 "f2bd6c209ea348f2d1a79c4afe12e7a53f21fda2212ffe06181ca9851ed83787"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "openjdk"

  def install
    libexec.install "onelogin-aws-assume-role-cli/dist/onelogin-aws-cli.jar"
    bin.write_jar_script libexec/"onelogin-aws-cli.jar", "onelogin-aws-cli"
  end

  def caveats
    <<~EOS
      Put your OneLogin API credentials in ~/.onelogin/onelogin.sdk.properties.
      See https://github.com/onelogin/onelogin-aws-cli-assume-role#settings
    EOS
  end

  test do
    assert_match "Show the help guide", shell_output("#{bin}/onelogin-aws-cli --help")
  end
end
