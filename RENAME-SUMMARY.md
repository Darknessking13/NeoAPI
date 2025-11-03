# 🔄 Framework Rename: NeoAPI → ZyroAPI

**Date:** 2025-11-03  
**Reason:** Package name "neoapi" was already taken on npm

---

## ✅ Files Updated

### 📦 Core Files
- ✅ `package.json` - Updated name, main entry, exports
- ✅ `lib/neoapi.js` → `lib/zyroapi.js` - Renamed file
- ✅ `lib/zyroapi.js` - Updated class name `NeoAPI` → `ZyroAPI`
- ✅ `lib/zyroapi.js` - Updated logger source name
- ✅ `lib/zyroapi.js` - Updated module exports
- ✅ `LICENSE` - Updated copyright holder

### 📝 Documentation
- ✅ `README.md` - All references updated
  - Package name
  - Installation instructions
  - Code examples
  - Performance tables
  - GitHub links
  - Badges

### 🧪 Test Files
- ✅ `test/test-suite.js` - Updated imports and class usage
- ✅ `test/quick-test.js` - Updated imports and references
- ✅ `test/README.md` - Needs manual update (if exists)

### 📊 Benchmark Files
- ✅ `benchmark/neoapi-server.js` → `benchmark/zyroapi-server.js` - Renamed
- ✅ `benchmark/zyroapi-server.js` - Updated imports and ready signal
- ⚠️ `benchmark/benchmark.js` - Needs update for new filename
- ⚠️ `benchmark/simple-route.js` - May need updates

### 💡 Example Files
- ✅ `example/server.js` - Updated all imports and references

### 📚 Documentation Files (in docs/)
- ⚠️ All `.md` files in `docs/` folder need updating
- Files to update:
  - `docs/getting-started.md`
  - `docs/routing.md`
  - `docs/middleware.md`
  - `docs/plugins.md`
  - `docs/error-handling.md`
  - `docs/advanced-routing.md`
  - `docs/response.md`
  - `docs/server.md`
  - `docs/optimizations.md`
  - `docs/how to create plugins.md`
  - `docs/critical-optimizations-applied.md`

### 🔧 Script Files
- ⚠️ `scripts/validate-release.js` - Needs update
- ⚠️ `scripts/check-npm-package.js` - Needs update

---

## 🔄 Key Changes

### Class Name
```javascript
// Before
class NeoAPI extends EventEmitter { }
module.exports = { NeoAPI };

// After
class ZyroAPI extends EventEmitter { }
module.exports = { ZyroAPI };
```

### Usage
```javascript
// Before
const { NeoAPI } = require('neoapi');
const app = new NeoAPI();
app.plug(NeoAPI.jsonParser);
app.plug(NeoAPI.cors);

// After
const { ZyroAPI } = require('zyroapi');
const app = new ZyroAPI();
app.plug(ZyroAPI.jsonParser);
app.plug(ZyroAPI.cors);
```

### Package
```json
// Before
{
  "name": "neoapi",
  "main": "./lib/neoapi.js"
}

// After
{
  "name": "zyroapi",
  "main": "./lib/zyroapi.js"
}
```

---

## ⚠️ Remaining Tasks

### High Priority
1. **Update benchmark scripts** - Update references to zyroapi-server.js
2. **Update docs/ folder** - All markdown files need NeoAPI → ZyroAPI
3. **Update validation scripts** - Check for any hardcoded references

### Medium Priority
4. **Search for remaining references** - Run global search for "neoapi" (case-insensitive)
5. **Update CHANGELOG.md** - Document the rename
6. **Test all functionality** - Ensure nothing broke

### Low Priority
7. **Update any plugin references** - Check plugins folder for references
8. **Update .npmignore** - Already correct (uses lib/ pattern)

---

## 🧪 Testing Checklist

```bash
# 1. Test quick validation
node test/quick-test.js

# 2. Run full test suite
npm test

# 3. Run validation
npm run validate

# 4. Check package contents
npm run check-package

# 5. Test example server
node example/server.js

# 6. Run benchmarks (after updating benchmark.js)
npm run benchmark
```

---

## 📋 Search & Replace Commands

To find any remaining references:

```bash
# Windows PowerShell
Get-ChildItem -Recurse -File | Select-String -Pattern "neoapi" -CaseSensitive:$false

# Or use your IDE's global search:
# Search: neoapi (case-insensitive)
# Exclude: node_modules, .git
```

---

## 🚀 Next Steps

1. ✅ Update remaining documentation files
2. ✅ Update benchmark scripts
3. ✅ Run all tests
4. ✅ Commit changes
5. ✅ Create git tag for v0.0.1-preview
6. ✅ Publish to npm as `zyroapi`

---

**Status:** Core files updated ✅  
**Remaining:** Documentation and scripts need updates ⚠️
