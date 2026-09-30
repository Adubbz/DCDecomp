#include "clang-tidy/ClangTidyCheck.h"
#include "clang-tidy/ClangTidyModule.h"
#include "clang/AST/DeclCXX.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/Lex/Lexer.h"

using namespace clang::ast_matchers;

namespace clang::tidy::dcdecomp {

bool IsDataMember(const Decl *decl) {
    const auto *var = dyn_cast<VarDecl>(decl);

    return isa<FieldDecl>(decl) || (var && var->isStaticDataMember());
}

bool IsControlBlock(const Stmt *stmt) {
    return isa<IfStmt, ForStmt, CXXForRangeStmt, WhileStmt, DoStmt, SwitchStmt>(stmt) && !stmt->getBeginLoc().isMacroID();
}

class FieldsFirstCheck : public ClangTidyCheck {
public:
    FieldsFirstCheck(StringRef name, ClangTidyContext *context) : ClangTidyCheck(name, context) {}

    bool isLanguageVersionSupported(const LangOptions &lang_opts) const override { return lang_opts.CPlusPlus; }

    void registerMatchers(MatchFinder *finder) override {
        finder->addMatcher(cxxRecordDecl(isDefinition(), unless(isImplicit()), unless(isLambda()), unless(isUnion()), unless(ast_matchers::isTemplateInstantiation()),
                                         unless(isExpansionInSystemHeader()))
                               .bind("record"),
                           this);
    }

    void check(const MatchFinder::MatchResult &result) override {
        const auto *record = result.Nodes.getNodeAs<CXXRecordDecl>("record");
        bool        introduces_vptr = record->isDynamicClass() && llvm::none_of(record->bases(), [](const CXXBaseSpecifier &base) {
                                   const CXXRecordDecl *base_record = base.getType()->getAsCXXRecordDecl();

                                   return base_record && base_record->hasDefinition() && base_record->isDynamicClass();
                                      });
        const Decl *first_function = nullptr;
        bool        virtual_seen = false;

        for (const Decl *decl : record->decls()) {
            if (isa<CXXMethodDecl, FunctionTemplateDecl>(decl) && !decl->isImplicit()) {
                const auto *method = dyn_cast<CXXMethodDecl>(decl);

                if (!first_function) {
                    first_function = decl;
                }

                virtual_seen = virtual_seen || (method && method->isVirtual());
            } else if (first_function && IsDataMember(decl)) {
                if (!(virtual_seen && introduces_vptr)) {
                    const auto *field = dyn_cast<FieldDecl>(decl);
                    bool        anonymous = field && field->isAnonymousStructOrUnion();

                    diag(decl->getLocation(), "%select{data member %1|anonymous struct/union member}0 is declared after a member function of %2; declare data members first") << anonymous << cast<NamedDecl>(decl) << record;
                    diag(first_function->getLocation(), "first member function declared here", DiagnosticIDs::Note);
                }

                return;
            }
        }
    }
};

class NamedParametersCheck : public ClangTidyCheck {
public:
    NamedParametersCheck(StringRef name, ClangTidyContext *context) : ClangTidyCheck(name, context) {}

    bool isLanguageVersionSupported(const LangOptions &lang_opts) const override { return lang_opts.CPlusPlus; }

    void registerMatchers(MatchFinder *finder) override {
        finder->addMatcher(functionDecl(unless(isDefinition()), unless(isImplicit()), unless(isExpansionInSystemHeader()), unless(ast_matchers::isTemplateInstantiation())).bind("function"), this);
    }

    void check(const MatchFinder::MatchResult &result) override {
        const auto *function = result.Nodes.getNodeAs<FunctionDecl>("function");

        if (function->getLocation().isMacroID()) {
            return;
        }

        for (const ParmVarDecl *parameter : function->parameters()) {
            if (!parameter->getName().empty() || parameter->getLocation().isInvalid()) {
                continue;
            }

            unsigned  index = parameter->getFunctionScopeIndex();
            StringRef suggested;

            for (const FunctionDecl *other : function->redecls()) {
                if (other != function && index < other->getNumParams() && !other->getParamDecl(index)->getName().empty()) {
                    suggested = other->getParamDecl(index)->getName();
                    break;
                }
            }

            auto builder = diag(parameter->getLocation(), "parameter %0 of %1 has no name%select{|; another declaration names it %3}2") << (index + 1) << function << !suggested.empty() << suggested;

            if (!suggested.empty() && !parameter->getLocation().isMacroID()) {
                builder << FixItHint::CreateInsertion(parameter->getLocation(), (" " + suggested + " ").str());
            }
        }
    }
};

class BlockSpacingCheck : public ClangTidyCheck {
public:
    BlockSpacingCheck(StringRef name, ClangTidyContext *context) : ClangTidyCheck(name, context) {}

    bool isLanguageVersionSupported(const LangOptions &lang_opts) const override { return lang_opts.CPlusPlus; }

    void registerMatchers(MatchFinder *finder) override {
        finder->addMatcher(traverse(TK_IgnoreUnlessSpelledInSource, compoundStmt(unless(isExpansionInSystemHeader())).bind("block")), this);
    }

    void check(const MatchFinder::MatchResult &result) override {
        const auto          *block = result.Nodes.getNodeAs<CompoundStmt>("block");
        const SourceManager &sources = *result.SourceManager;
        const Stmt          *previous = nullptr;

        for (const Stmt *current : block->body()) {
            if (previous && !isa<SwitchCase>(current) && (IsControlBlock(previous) || IsControlBlock(current))) {
                CheckPair(sources, previous, current);
            }

            previous = current;

            while (const auto *label = dyn_cast<SwitchCase>(previous)) {
                previous = label->getSubStmt();
            }
        }
    }

private:
    void CheckPair(const SourceManager &sources, const Stmt *previous, const Stmt *current) {
        if (isa<NullStmt>(previous) || isa<NullStmt>(current)) {
            return;
        }

        SourceLocation end = Lexer::getLocForEndOfToken(sources.getExpansionRange(previous->getEndLoc()).getEnd(), 0, sources, getLangOpts());
        SourceLocation begin = sources.getExpansionLoc(current->getBeginLoc());

        if (end.isInvalid() || !sources.isWrittenInSameFile(end, begin) || !sources.isBeforeInTranslationUnit(end, begin)) {
            return;
        }

        StringRef gap = Lexer::getSourceText(CharSourceRange::getCharRange(end, begin), sources, getLangOpts());
        size_t    newline = gap.find('\n');

        if (newline == StringRef::npos) {
            return;
        }

        SmallVector<StringRef, 8> lines;
        gap.substr(newline + 1).split(lines, '\n');
        lines.pop_back();

        if (llvm::any_of(lines, [](StringRef line) { return line.trim().empty(); })) {
            return;
        }

        const char *where = IsControlBlock(current) ? "before this block" : "after the block above";

        diag(begin, "a blank line is needed %0") << where << FixItHint::CreateInsertion(end.getLocWithOffset(newline + 1), "\n");
    }
};

class DecompModule : public ClangTidyModule {
public:
    void addCheckFactories(ClangTidyCheckFactories &factories) override {
        factories.registerCheck<FieldsFirstCheck>("dcdecomp-fields-first");
        factories.registerCheck<NamedParametersCheck>("dcdecomp-named-parameters");
        factories.registerCheck<BlockSpacingCheck>("dcdecomp-block-spacing");
    }
};

} // namespace clang::tidy::dcdecomp

static clang::tidy::ClangTidyModuleRegistry::Add<clang::tidy::dcdecomp::DecompModule> X("dcdecomp-module", "Enforces the decomp's conventions");
