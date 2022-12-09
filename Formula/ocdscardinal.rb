class Ocdscardinal < Formula
  desc "Measure red flags and procurement indicators using OCDS data"
  homepage "https://github.com/open-contracting/cardinal-rs"
  license "MIT"
  head "https://github.com/open-contracting/cardinal-rs.git", branch: "main"
  url "https://github.com/open-contracting/cardinal-rs/archive/0.1.0.tar.gz"
  sha256 "8408aea9b1f47369e07697c4bd2411179e18fa5c1e9fe5b79b9f2ff1dd712323"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  # bottle do
  #   root_url "https://github.com/open-contracting/cardinal-rs/releases/tag/0.1.0"
  #   sha256 cellar: :any_skip_relocation, monterey:     ""
  #   sha256 cellar: :any_skip_relocation, big_sur:      ""
  #   sha256 cellar: :any_skip_relocation, catalina:     ""
  #   sha256 cellar: :any_skip_relocation, x86_64_linux: ""
  # end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args, *(ENV["CARGO_TARGET"] ? ["--target", ENV["CARGO_TARGET"]] : [])
  end

  test do
    (testpath/"test.jsonl").write("0\n")
    assert_equal("{\"\": 1}\n", shell_output("#{bin}/ocdscardinal coverage test.jsonl"))
  end
end
