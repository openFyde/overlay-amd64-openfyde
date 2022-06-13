# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

cros_pre_src_prepare_amd64_openfyde_patches() {
  # skip `HANDLE_EINTR(selinux_restorecon(path.value().c_str(), 0))`
  # it causes segmentation fault, `/dev/tpm0` won't be available
  # trunksd and attestation will not be able to access `/dev/tpm0`
  eapply -p2 ${AMD64_OPENFYDE_BASHRC_FILEPATH}/skip-selinux_restorecon.patch
}
