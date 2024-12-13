
workdir=/workdir
cont_name=podnvim
img_name=pod_nvim:0.1

run_cmd=podman run -it --rm --hostname ${cont_name} --name ${cont_name} -v ${PWD}:${workdir}:Z ${img_name}

alias_name=ide

all: build install run

build:
	podman build -f ./Containerfile -t ${img_name}

install:
	@echo "Installing alias ${alias_name}"
	@./ide_nvim.sh install ${alias_name} "${run_cmd}" 
#./ide_nvim.sh install "podman run -it --rm --hostname ${cont_name} --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name}"

run:
	@${run_cmd}
#podman run -it --rm --hostname ${cont_name} --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name}

remove:
	@echo "Removing alias ${alias_name}"
	@./ide_nvim.sh remove ${alias_name} "${run_cmd}"
#./ide_nvim.sh remove "podman run -it --rm --hostname ${cont_name} --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name}"

clean: remove
	podman image prune -f
	podman image 


# nvim:
# 	podman run -it --rm --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name} nvim
#
# replace:
# 	podman run -it --replace --name ${cont_name} -v ${PWD}:${WORKDIR}:Z ${img_name}
#
# attach:
# 	podman run --attach ${cont_name}
