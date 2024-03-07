{...}:
{
    programs.zsh.zsh-abbr.abbreviations = {
        "dco" = "docker-compose";
        "dcod" = "docker-compose down";
        "dcofresh" = "docker-compose-fresh";
        "dcol" = "docker-compose logs -f --tail 100";
        "dcou" = "docker-compose up -d";
        "dk" = "docker";
        "dkbash" = "dkelc";
        "dkelc" = "docker exec -it $(dklcid) bash --login";
        "dkex" = "docker exec -it ";
        "dki" = "docker images";
        "dkideps" = "docker-image-dependencies";
        "dkip" = "docker image prune -a -f";
        "dklc" = "docker ps -l";
        "dklcid" = "docker ps -l -q";
        "dklcip" = "docker inspect -f \"{{.NetworkSettings.IPAddress}}\" $(docker ps -l -q)";
        "dkps" = "docker ps";
        "dkpsa" = "docker ps -a";
        "dkre" = "docker-runtime-environment";
        "dkri" = "docker run --rm -i ";
        "dkric" = "docker run --rm -i -v $PWD:/cwd -w /cwd ";
        "dkrit" = "docker run --rm -it ";
        "dkritc" = "docker run --rm -it -v $PWD:/cwd -w /cwd ";
        "dkrmac" = "docker rm $(docker ps -a -q)";
        "dkrmall" = "docker-remove-stale-assets";
        "dkrmflast" = "docker rm -f $(dklcid)";
        "dkrmi" = "docker-remove-images";
        "dkrmlc" = "docker-remove-most-recent-container";
        "dkrmli" = "docker-remove-most-recent-image";
        "dkrmui" = "docker images -q -f dangling=true | xargs -r docker rmi";
        "dks" = "docker start";
        "dksp" = "docker system prune -a -f";
        "dkvp" = "docker volume prune -f";
    };
}