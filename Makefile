WORKDIR=/workdir
cont_name=podnvim
img_name=pod_nvim:0.1


build:
	podman build -f ./Containerfile -t ${img_name}

run:
	podman run -it --rm --hostname ${cont_name} --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name}

nvim:
	podman run -it --rm --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name} nvim

replace:
	podman run -it --replace --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name}

attach:
	podman run --attach ${cont_name}
