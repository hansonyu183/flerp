import 'package:flutter/material.dart';

List _iconList = [
  Icons.account_balance,
  Icons.account_balance_wallet,
  Icons.account_box,
  Icons.airplay,
  Icons.apps,
  Icons.art_track,
  Icons.assessment,
  Icons.assignment,
  Icons.blur_circular,
  Icons.blur_linear,
  Icons.blur_on,
  Icons.burst_mode,
  Icons.business,
  Icons.business_center,
  Icons.calendar_today,
  Icons.calendar_view_day,
  Icons.camera,
  Icons.card_giftcard,
  Icons.card_membership,
  Icons.card_travel,
  Icons.casino,
  Icons.chrome_reader_mode,
  Icons.collections_bookmark,
  Icons.computer,
  Icons.confirmation_number,
  Icons.content_paste,
  Icons.credit_card,
  Icons.crop_original,
  Icons.dashboard,
  Icons.developer_board,
  Icons.devices,
  Icons.devices_other,
  Icons.dialpad,
  Icons.dns,
  Icons.domain,
  Icons.drafts,
  Icons.dvr,
  Icons.email,
  Icons.event,
  Icons.event_note,
  Icons.extension,
  Icons.featured_play_list,
  Icons.featured_video,
  Icons.filter,
  Icons.filter_b_and_w,
  Icons.filter_frames,
  Icons.filter_none,
  Icons.format_align_justify,
  Icons.gradient,
  Icons.grain,
  Icons.graphic_eq,
  Icons.grid_on,
];

List _menuIcon = [];

dynamic getIcon() {
  var icon;
  if (_iconList.length > 0) {
    icon = _iconList.removeLast();
    _menuIcon.add(icon);
  } else {
    icon = _menuIcon.removeLast();
    _iconList.add(icon);
  }
  return icon;
}
