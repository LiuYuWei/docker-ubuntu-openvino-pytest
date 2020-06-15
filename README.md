# docker-ubuntu-openvino-pytest
Use docker to do the openvino unittest.

```cmd
$ docker build simon3458/openvino_ubuntu18_opencv_pytest .

$ docker run -u root --rm -v "$PWD":/home/app/workdir -w /home/app/workdir -e PROJECT_PATH=/home/app/workdir --name pytest simon3458/openvino_ubuntu18_opencv_pytest /bin/bash -c "export PYTHONPATH=/home/app/workdir && source /opt/intel/openvino/bin/setupvars.sh && pytest -q -p no:warnings --cov-config=config/ci_pipeline/.pytest_coveragerc --cov=. --cov-report term-missing -o log_cli=true --capture=no tests/"
```
