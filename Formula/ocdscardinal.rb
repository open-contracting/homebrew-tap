class Ocdscardinal < Formula
  desc "Measure red flags and procurement indicators using OCDS data"
  homepage "https://github.com/open-contracting/cardinal-rs"
  license "MIT"

  if OS.mac?
    url "https://github.com/open-contracting/cardinal-rs/releases/download/0.1.0/ocdscardinal-0.1.0-x86_64-apple-darwin.zip"
    sha256 "bdd3fab73fe034d79518c76cffe474dbb0a19eeea2387c66a59631d7f5f5a949"
  elsif OS.linux?
    url "https://github.com/open-contracting/cardinal-rs/releases/download/0.1.0/ocdscardinal-0.1.0-x86_64-unknown-linux-gnu.zip"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  end

  def install
    bin.install "ocdscardinal"
  end

  test do
    (testpath/"test.jsonl").write("0\n")
    assert_equal("{\"\": 1}\n", shell_output("#{bin}/ocdscardinal coverage test.jsonl"))
  end
end
