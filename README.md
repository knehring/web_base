# web-base-cookbook

Sets up a base for installing apache, php5.4, and users.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['web-base']['packages']</tt></td>
    <td>Which packages will be installed by the base</td>
    <td><tt><ul><li>vim</li><li> git</li><li>screen</lie><li>curl</li><li>php5-mcrypt</li><li>php5-gd<li></li>php5-mysql</li></tt></td>
  </tr>
  <tr>
    <td><tt>['web-base']['user']</tt></td>
    <td>Each user you want</td>
    <td><tt>Add user_name and ssh_keys foe each user.  </tt></td>
  </tr>
</table>

## Usage

### web-base::default

Include `web-base` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[web-base::default]"
  ]
}
```

## License and Authors

Author:: Kyle Nehring (<knehring@gmail.com>)
