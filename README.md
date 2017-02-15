# jjb_bootstrap

## Scope

This is quick cookbook to help bootstrap getting the JJB working on a Jenkins instance.

You'll need to take note of the `API TOKEN` for the `jenkins_jobs.ini` file from the Jenkins instance.

**NOTE:** This is only an example, I wouldn't put this into production without learning from it.

## Requirements

- Chef 12.0.0 or higher

## Usage

### default.rb

This will bootstrap the Jenkins an the JJB into `/jjb/` on the machine you run this on.

## Contributing
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors
- Author:: JJ Asghar (jj@chef.io)

```text
Copyright 2017 JJ Asghar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
