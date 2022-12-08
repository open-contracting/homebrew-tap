class Ocdscardinal < Formula
  desc "Measure red flags and procurement indicators using OCDS data"
  homepage "https://github.com/open-contracting/cardinal-rs"
  url "https://github.com/open-contracting/cardinal-rs/releases/download/0.1.0/ocdscardinal-0.1.0-x86_64-apple-darwin.zip"
  sha256 "bdd3fab73fe034d79518c76cffe474dbb0a19eeea2387c66a59631d7f5f5a949"
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
