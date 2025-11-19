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
    extends
        $AsyncNotifierProvider<MainlistPageViewModel, Map<String, dynamic>> {
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
    r'a8399626dcb7272d5962ea12074d04a380b0631f';

abstract class _$MainlistPageViewModel
    extends $AsyncNotifier<Map<String, dynamic>> {
  FutureOr<Map<String, dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, dynamic>>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, dynamic>>,
                Map<String, dynamic>
              >,
              AsyncValue<Map<String, dynamic>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
