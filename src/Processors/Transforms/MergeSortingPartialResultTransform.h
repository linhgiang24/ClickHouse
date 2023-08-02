#pragma once

#include <Processors/Transforms/PartialResultTransform.h>

namespace DB
{

class MergeSortingPartialResultTransform : public PartialResultTransform
{
public:
    using MergeSortingTransformPtr = std::shared_ptr<MergeSortingTransform>;

    MergeSortingPartialResultTransform(
        const Block & header, MergeSortingTransformPtr merge_sorting_transform_,
        UInt64 partial_result_limit_, UInt64 partial_result_duration_ms_);

    String getName() const override { return "MergeSortingPartialResultTransform"; }

    ShaphotResult getRealProcessorSnapshot() override;

private:
    MergeSortingTransformPtr merge_sorting_transform;
};

}
