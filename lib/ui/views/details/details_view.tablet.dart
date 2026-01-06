import 'package:flutter/material.dart';
import 'package:project_micah/ui/widgets/common/motorcycle_showcase/motorcycle_showcase.dart';
import 'package:project_micah/ui/widgets/common/parts_overlay/parts_overlay.dart';
import 'package:project_micah/ui/widgets/common/parts_description/parts_description.dart';
import 'package:stacked/stacked.dart';

import 'details_viewmodel.dart';
import 'details_view_helpers.dart';
import 'package:project_micah/ui/widgets/common/three_d/three_d_viewer.dart';
import 'package:project_micah/ui/utils/constants/ui_helpers.dart';
import 'package:project_micah/ui/utils/constants/app_colors.dart';

class DetailsViewTablet extends ViewModelWidget<DetailsViewModel> {
  const DetailsViewTablet({super.key});

  @override
  Widget build(BuildContext context, DetailsViewModel viewModel) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    // Show error if not in landscape mode
    if (!isLandscape) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(UIHelpers.spacing24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.screen_rotation,
                  size: 80,
                  color: AppColors.primary,
                ),
                UIHelpers.verticalSpace24,
                Text(
                  'Please rotate to landscape',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                UIHelpers.verticalSpace16,
                Text(
                  'The 3D viewer requires landscape orientation\nor a larger screen for the best experience.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Use desktop layout when in landscape
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Header with title and See All Parts button
              Container(
                padding: const EdgeInsets.all(UIHelpers.spacing24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: AppColors.border),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'INTERACTIVE 3D MOTORCYCLE VIEWER',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          UIHelpers.verticalSpace8,
                          Text(
                            'Zoom, rotate, and explore each part in full 3D detail.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.primary,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    // See All Parts button
                    ElevatedButton.icon(
                      onPressed: viewModel.togglePartsOverlay,
                      icon: const Icon(Icons.view_module),
                      label: const Text('SEE ALL PARTS'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: UIHelpers.spacing24,
                          vertical: UIHelpers.spacing16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Main content area
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Left sidebar - Motorcycle catalog with collapse toggle
                    Stack(
                      children: [
                        MotorcycleShowcase(
                          motorcycles: viewModel.motorcycles,
                          selectedMotorcycle: viewModel.selectedMotorcycle,
                          isCollapsed: viewModel.isMotorcycleShowcaseCollapsed,
                          onMotorcycleSelected: (name) =>
                              viewModel.selectMotorcycle(name),
                        ),
                        // Collapse/Expand button
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: Icon(
                              viewModel.isMotorcycleShowcaseCollapsed
                                  ? Icons.chevron_right
                                  : Icons.chevron_left,
                              size: 20,
                            ),
                            onPressed: viewModel.toggleMotorcycleShowcase,
                            tooltip: viewModel.isMotorcycleShowcaseCollapsed
                                ? 'Expand'
                                : 'Collapse',
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Center - 3D Viewer with bottom controls
                    Expanded(
                      child: Column(
                        children: [
                          // 3D Model viewer
                          Expanded(
                            child: ThreeDViewer(
                              assemblyModelPaths:
                                  viewModel.allAssemblyModelPaths,
                              assemblyMtlPaths: viewModel.allAssemblyMtlPaths,
                              disassemblyModelPaths:
                                  viewModel.allDisassemblyModelPaths,
                              disassemblyMtlPaths:
                                  viewModel.allDisassemblyMtlPaths,
                              modelName: viewModel.isAssembleMode
                                  ? '${viewModel.selectedMotorcycle} - Full Assembly'
                                  : '${viewModel.selectedMotorcycle} - ${viewModel.selectedPart ?? "Parts View"}',
                              height: double.infinity,
                              isAssembleMode: viewModel.isAssembleMode,
                              disassemblyDistance: viewModel.partDistance,
                              onToggleMode: (mode) =>
                                  viewModel.toggleMode(mode),
                              onPartSelected: (modelPath) {
                                String? matchedKey;
                                viewModel.partsModels.forEach((k, v) {
                                  if (v['obj'] == modelPath) {
                                    matchedKey = k;
                                  }
                                });
                                if (matchedKey != null) {
                                  viewModel.selectPart(matchedKey!);
                                }
                              },
                            ),
                          ),

                          // Bottom controls bar
                          Container(
                            padding: const EdgeInsets.all(UIHelpers.spacing12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: AppColors.border),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, -2),
                                ),
                              ],
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: constraints.maxWidth,
                                    ),
                                    child: Row(
                                      children: [
                                        ToggleButton(
                                          isAssembleMode:
                                              viewModel.isAssembleMode,
                                          isEnabled: viewModel.has3DModel,
                                          onToggle: () => viewModel.toggleMode(
                                              !viewModel.isAssembleMode),
                                        ),
                                        if (!viewModel.isAssembleMode) ...[
                                          UIHelpers.horizontalSpace16,
                                          Text(
                                            'Parts Distance:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      AppColors.textSecondary,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          UIHelpers.horizontalSpace8,
                                          SizedBox(
                                            width: 150,
                                            child: Slider(
                                              value: viewModel.partDistance,
                                              min: 0.0,
                                              max: 20.0,
                                              divisions: 100,
                                              label: viewModel.partDistance
                                                  .toStringAsFixed(1),
                                              onChanged: (value) => viewModel
                                                  .updatePartDistance(value),
                                            ),
                                          ),
                                          UIHelpers.horizontalSpace8,
                                          Text(
                                            viewModel.partDistance
                                                .toStringAsFixed(1),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      AppColors.textSecondary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                        UIHelpers.horizontalSpace24,
                                        ControlItem(
                                          icon: Icons.mouse,
                                          label: 'Drag',
                                          action: 'Rotate',
                                        ),
                                        UIHelpers.horizontalSpace12,
                                        ControlItem(
                                          icon: Icons.zoom_in,
                                          label: 'Scroll',
                                          action: 'Zoom',
                                        ),
                                        UIHelpers.horizontalSpace12,
                                        ControlItem(
                                          icon: Icons.refresh,
                                          label: 'R',
                                          action: 'Reset',
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Sidebar toggle bar (narrow blue vertical strip) - only show when part is selected
                    if (viewModel.selectedPart != null)
                      GestureDetector(
                        onTap: viewModel.toggleRightSidebar,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.border,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.border.withValues(alpha: 0.3),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                viewModel.isRightSidebarVisible
                                    ? Icons.chevron_right
                                    : Icons.chevron_left,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),

                    // Right sidebar - Details (conditionally visible)
                    if (viewModel.isRightSidebarVisible)
                      SizedBox(
                        width: 400,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.surface,
                            border: Border(
                              left: BorderSide(color: AppColors.border),
                            ),
                          ),
                          child: viewModel.isBusy
                              ? const Center(child: CircularProgressIndicator())
                              : (!viewModel.isAssembleMode &&
                                      viewModel.selectedPart != null)
                                  ? PartsDescription(
                                      imageUrl: viewModel.partsImageUrl,
                                      partsName: viewModel.partsName,
                                      sku: viewModel.partsSku,
                                      category: viewModel.partsCategory,
                                      description: viewModel.partsDescription,
                                      partNo: viewModel.partsPartNo,
                                      quantity: viewModel.partsQuantity,
                                      groupNo: viewModel.partsGroupNo,
                                      label: 'PART DETAILS',
                                    )
                                  : const SizedBox.shrink(),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          // Parts overlay (full screen) - positioned on top
          if (viewModel.isPartsOverlayOpen)
            Positioned.fill(
              child: PartsOverlay(
                engineParts: viewModel.engineSpecs,
                accessoryParts: viewModel.accessoriesSpecs,
                selectedPart: viewModel.selectedPart,
                onPartSelected: (part) => viewModel.selectPart(part),
                onClose: viewModel.togglePartsOverlay,
              ),
            ),
        ],
      ),
    );
  }
}
