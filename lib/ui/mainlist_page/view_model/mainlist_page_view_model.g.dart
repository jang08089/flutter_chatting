// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainlist_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainlistPageViewModel)
const mainlistPageViewModelProvider = MainlistPageViewModelProvider._();

final class MainlistPageViewModelProvider
    extends $AsyncNotifierProvider<MainlistPageViewModel, List<dynamic>> {
  const MainlistPageViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainlistPageViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainlistPageViewModelHash();

  @$internal
  @override
  MainlistPageViewModel create() => MainlistPageViewModel();
}

String _$mainlistPageViewModelHash() =>
    r'fb821c607cb1ea49167280581c5e0f2c61724be0';

abstract class _$MainlistPageViewModel extends $AsyncNotifier<List<dynamic>> {
  FutureOr<List<dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<dynamic>>, List<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<dynamic>>, List<dynamic>>,
              AsyncValue<List<dynamic>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
