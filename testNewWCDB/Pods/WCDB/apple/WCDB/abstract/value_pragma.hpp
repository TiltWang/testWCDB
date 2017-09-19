/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef value_pragma_hpp
#define value_pragma_hpp

#include <WCDB/declare.hpp>
#include <WCDB/describable.hpp>

namespace WCDB {

class PragmaValue : public Describable {
public:
    PragmaValue(const Pragma &pragma);
    PragmaValue(const std::string &value);
    PragmaValue(const char *value);

    template <typename T>
    PragmaValue(
        const T &value,
        typename std::enable_if<std::is_arithmetic<T>::value>::type * = nullptr)
        : Describable(std::to_string(value))
    {
    }
};

} //namespace WCDB

#endif /* value_pragma_hpp */
