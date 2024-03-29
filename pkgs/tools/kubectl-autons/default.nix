{ lib, buildGoModule, fetchFromGitHub, installShellFiles }:
buildGoModule rec {
  pname = "kubectl-autons";
  version = "0.2.2";
  src = fetchFromGitHub {
    owner = "ragrag";
    repo = "kubectl-autons";
    rev = "v${version}";
    sha256 = "sha256-tnFvy5aUIAt4SUR9SQdPbHmL79Kq0VmUXkxkEyzxZio=";
  };

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  postInstall = ''
    mv "$out/bin/src" "$out/bin/kubectl-autons"
  '';

  meta = with lib; {
    description = "Automatic namespace detection for kubectl commands";
    license = licenses.asl20;
    homepage = "https://github.com/ragrag/kubectl-autons";
    maintainers = with maintainers; [{
      email = "mail@kvineet.in";
      github = "kvineet";
      githubId = 6461922;
      name = "Vineet Kulkarni";
    }];
  };
}
