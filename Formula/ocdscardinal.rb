class Ocdscardinal < Formula
  desc "Measure red flags and procurement indicators using OCDS data."
  homepage "http://github.com/open-contracting/cardinal-lib"
  url "https://github.com/open-contracting/cardinal-rs/releases/download/0.1.0/ocdscardinal-0.1.0-x86_64-apple-darwin.zip"
  version "0.1.0"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"
  head "https://github.com/open-contracting/cardinal-rs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"test.jsonl").write("0\n")
    assert_equal('{"": 1}\n', shell_output("#{bin}/ocdscardinal coverage test.jsonl"))
  end
end
