{ lib, buildGoModule, fetchFromGitHub, installShellFiles }:
let versions = builtins.fromJSON(builtins.readFile ../../versions.json);
in 
buildGoModule rec {
  pname = "kubectl-ctxns";
  version = versions.${pname}.version;

  src = fetchFromGitHub {
    owner = versions.${pname}.owner;
    repo = versions.${pname}.repo;
    rev = "v${version}";
    sha256 = "sha256-WY0zFt76mvdzk/s2Rzqys8n+DVw6qg7V6Y8JncOUVCM=";
  };

  patches = [
    ./bump-golang-x-sys.patch
  ];

  vendorHash = "sha256-p4KUBmJw6hWG1J2qwg4QBbh6Vo1cr/HQz0IqytIDJjU=";

  nativeBuildInputs = [ installShellFiles ];

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  postInstall = ''
    installShellCompletion completion/*
    ln -fs "$out/bin/kubectx" "$out/bin/kubectl-ctx"
    ln -fs "$out/bin/kubens" "$out/bin/kubectl-ns"
  '';

  meta = with lib; {
    description = "Fast way to switch between clusters and namespaces in kubectl!";
    license = licenses.asl20;
    homepage = "https://github.com/ahmetb/kubectx";
    maintainers = with maintainers; [ jlesquembre ];
  };
}