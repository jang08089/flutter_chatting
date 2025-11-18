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
    extends $AsyncNotifierProvider<MainlistPageViewModel, List<Profile>> {
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
    r'ecac434581a08a6c27add5c2b01d5fa302a13e9a';

abstract class _$MainlistPageViewModel extends $AsyncNotifier<List<Profile>> {
  FutureOr<List<Profile>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Profile>>, List<Profile>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Profile>>, List<Profile>>,
              AsyncValue<List<Profile>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
