import 'package:rive/src/generated/audio_event_base.dart';
import 'package:rive/src/rive_core/artboard.dart';
import 'package:rive/src/rive_core/assets/audio_asset.dart';
import 'package:rive/src/rive_core/assets/file_asset.dart';

export 'package:rive/src/generated/audio_event_base.dart';

class AudioEvent extends AudioEventBase with FileAssetReferencer<AudioAsset> {
  @override
  void changeArtboard(Artboard? value) {
    artboard?.internalRemoveEvent(this);
    super.changeArtboard(value);
    artboard?.internalAddEvent(this);
  }

  @override
  void assetIdChanged(int from, int to) {
    asset = context.resolve(to);
  }

  @override
  void copy(covariant AudioEvent source) {
    super.copy(source);
    asset = source.asset;
  }

  @override
  int get assetIdPropertyKey => AudioEventBase.assetIdPropertyKey;
}
