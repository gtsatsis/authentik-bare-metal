STARTING_DIR=$(pwd)

chmod +x $STARTING_DIR/01_install_deps.sh && $STARTING_DIR/01_install_deps.sh
chmod +x $STARTING_DIR/02_create_authentik_user.sh && $STARTING_DIR/02_create_authentik_user.sh
chmod +x $STARTING_DIR/03_clone.sh && $STARTING_DIR/03_clone.sh
chmod +x $STARTING_DIR/04_build_web_components.sh && $STARTING_DIR/04_build_web_components.sh
chmod +x $STARTING_DIR/05_build_server.sh && $STARTING_DIR/05_build_server.sh
chmod +x $STARTING_DIR/06_deploy.sh && $STARTING_DIR/06_deploy.sh
chmod +x $STARTING_DIR/07_configure.sh && $STARTING_DIR/07_configure.sh