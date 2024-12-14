
workdir=/workdir
cont_name=podnvim
img_name=pod_nvim:0.1

run_cmd=podman run -it --rm --hostname ${cont_name} --name ${cont_name} -v ${PWD}:${workdir}:Z ${img_name}

alias_name=ide

all: build install

build:
	podman build -f ./Containerfile -t ${img_name}

install:
	@echo "Installing alias ${alias_name}"
	@./ide_nvim.sh install ${alias_name} "${run_cmd}"
	
run:
	@${run_cmd}

remove:
	@echo "Removing alias ${alias_name}"
	@./ide_nvim.sh remove ${alias_name} "${run_cmd}"

clean: remove
	podman image rm ${img_name} 
	podman image prune -f

