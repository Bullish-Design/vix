{ config, pkgs, package, utils, lib, inputs, packagename, ...  }@args: {
  ${packagename} = {
    enable = true;
    packageNames = [ packagename ];
    packageDefinitions.replace = {
      ${packagename} = { pkgs, ... }: {
        settings = {
        };
        categories = {
          nixCats_test_names = {
            nixos_hello = true;
          };
        };
      };
    };
    users.testuser = {
      enable = true;
      packageNames = [ packagename ];
      packageDefinitions.replace = {
        ${packagename} = { pkgs, ... }: {
          settings = {
          };
          categories = {
            nixCats_test_names = {
              nixos_user_hello = true;
            };
          };
        };
      };
    };
  };
}
