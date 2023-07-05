#
# Copyright (c) 2023 Nordic Semiconductor
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause

# Include hci_rpmsg if enabled.
if(SB_CONFIG_NETCORE_HCI_RPMSG)
  ExternalZephyrProject_Add(
    APPLICATION ${SB_CONFIG_NETCORE_HCI_RPMSG_NAME}
    SOURCE_DIR ${ZEPHYR_BASE}/samples/bluetooth/hci_rpmsg
    BOARD ${SB_CONFIG_NETCORE_HCI_RPMSG_BOARD}
  )
  list(APPEND IMAGES "${SB_CONFIG_NETCORE_HCI_RPMSG_NAME}")

  if(NOT "${SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN}" IN_LIST PM_DOMAINS)
    list(APPEND PM_DOMAINS ${SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN})
  endif()
  list(APPEND PM_${SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN}_IMAGES
      "${SB_CONFIG_NETCORE_HCI_RPMSG_NAME}"
  )
  set(PM_${SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN}_IMAGES
      ${PM_${SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN}_IMAGES}
      PARENT_SCOPE
  )

  if(SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN_APP)
    set(DOMAIN_APP_${SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN}
        "${SB_CONFIG_NETCORE_HCI_RPMSG_NAME}" PARENT_SCOPE
    )
  endif()
  set(${SB_CONFIG_NETCORE_HCI_RPMSG_DOMAIN}_PM_DOMAIN_DYNAMIC_PARTITION
      ${SB_CONFIG_NETCORE_HCI_RPMSG_NAME} CACHE INTERNAL ""
  )
endif()

set(PM_DOMAINS ${PM_DOMAINS} PARENT_SCOPE)
set(IMAGES     ${IMAGES}     PARENT_SCOPE)