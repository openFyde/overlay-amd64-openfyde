# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

cros_pre_src_prepare_amd64_openfyde() {
  # eapply -p2 ${AMD64_OPENFYDE_BASHRC_FILEPATH}/remove-params-pemm0-ro.patch
  eapply -p2 ${AMD64_OPENFYDE_BASHRC_FILEPATH}/skip-untrusted-vm-error.patch
}
